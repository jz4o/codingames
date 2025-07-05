/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const nImp: number = parseInt(readline());
const imports: string[] = [];
for (let i = 0; i < nImp; i++) {
    const _import: string = readline();
    imports.push(_import);
}
const nDep: number = parseInt(readline());
const dependencyRows: string[] = [];
for (let i = 0; i < nDep; i++) {
    const dependency: string = readline();
    dependencyRows.push(dependency);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Dependency {
    name: string;
    directDependencies: string[];
    dependencies: string[];
    interdependence: boolean;

    constructor(name: string, dependencies: string[]) {
        this.name = name;
        this.directDependencies = dependencies;
        this.dependencies = dependencies;
        this.interdependence = false;
    }

    addDependencies: (dependencies: string[]) => void = (dependencies: string[]): void => {
        this.dependencies.push(...dependencies);
    };

    isDependent: (name: string) => boolean = (name: string): boolean => {
        return this.dependencies.includes(name);
    };

    isInterdependence: () => boolean = (): boolean => {
        return this.interdependence;
    };

    setInterdependence: () => void = (): void => {
        this.interdependence = true;
    };

    getRequireName: (importedNames: string[], dependencies: Dependency[]) => string | null = (importedNames: string[], dependencies: Dependency[]): string | null => {
        const tempImportedNames: string[] = [...importedNames];
        const dependencyNameStack: string[] = [...this.directDependencies];
        while (dependencyNameStack.length > 0) {
            const dependencyName: string = dependencyNameStack.shift();
            if (!(tempImportedNames.includes(dependencyName))) {
                return dependencyName;
            }

            importedNames.push(dependencyName);

            const dependency: Dependency = dependencies.find(dependency => dependency.name === dependencyName);
            if (!dependency) {
                continue;
            }

            if (dependency.isInterdependence) {
                return dependency.name;
            }

            dependencyNameStack.unshift(...dependency.directDependencies);
        }

        return null;
    };
}

interface ImportResult {
    result: boolean;
    errorMessage: string | null;
};

const dryImport: (importNames: string[], dependencies: Dependency[]) => ImportResult = (importNames: string[], dependencies: Dependency[]): ImportResult => {
    let importResult: ImportResult;

    const importedNames: string[] = [];
    importNames.some(importName => {
        const dependency: Dependency = dependencies.find(dependency => dependency.name === importName);

        const requireNames: string[] = (dependency?.dependencies || []).filter(d => !importedNames.includes(d));
        if (requireNames.length > 0) {
            const requireName: string = dependency.getRequireName(importedNames, dependencies);
            const errorMessage: string = `Import error: tried to import ${importName} but ${requireName} is required.`;

            importResult = { result: false, errorMessage };
            return true;
        }

        importedNames.push(importName);

        return false;
    });

    return importResult || { result: true, errorMessage: null };
};

const reorderImport: (importNames: string[], dependencies: Dependency[]) => string[] = (importNames: string[], dependencies: Dependency[]): string[] => {
    const reorderImportNames: string[] = [];

    const sortedImportNames: string[] = [...importNames].sort();
    while (sortedImportNames.length > 0) {
        const importableName: string = sortedImportNames.find(importName => {
            const dependency: Dependency = dependencies.find(dependency => dependency.name === importName);
            return !dependency || dependency.dependencies.filter(d => !reorderImportNames.includes(d)).length === 0;
        });

        if (!importableName) {
            return [];
        }

        reorderImportNames.push(importableName);
        sortedImportNames.splice(sortedImportNames.indexOf(importableName), 1);
    }

    return reorderImportNames;
};

const dependencies: Dependency[] = dependencyRows.map(dependency => {
    const [from, to]: string[] = dependency.split(' requires ');
    return new Dependency(from, to.split(', '));
});

dependencies.forEach(dependency => {
    const callerDependencies: Dependency[] = dependencies.filter(d => d.isDependent(dependency.name));
    callerDependencies.forEach(callerDependency => {
        if (dependency.isDependent(callerDependency.name)) {
            callerDependency.setInterdependence();
            dependencies
                .filter(d => d.isDependent(callerDependency.name))
                .forEach(d => d.setInterdependence());
        }

        callerDependency.addDependencies(dependency.dependencies);
    });
});

const importNames: string[] = imports.map(importRow => importRow.replace('import ', ''));

const dryRunResult: ImportResult = dryImport(importNames, dependencies);

let results: string[];
if (dryRunResult.result) {
    results = ['Compiled successfully!'];
} else {
    const isInterDependencies: boolean = importNames.some(importName => {
        return dependencies.find(dependency => dependency.name === importName)?.isInterdependence();
    });

    if (isInterDependencies) {
        results = [
            dryRunResult.errorMessage,
            'Fatal error: interdependencies.'
        ];
    } else {
        const reorderImports: string[] = reorderImport(importNames, dependencies).map(importName => `import ${importName}`);

        results = [
            dryRunResult.errorMessage,
            'Suggest to change import order:',
            ...reorderImports
        ];
    }
}

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

