# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n_imp = int(input())
import_rows = []
for _ in range(n_imp):
    _import = input()
    import_rows.append(_import)
n_dep = int(input())
dependency_rows = []
for _ in range(n_dep):
    dependency = input()
    dependency_rows.append(dependency)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Dependency:
    def __init__(self, name, dependencies):
        self.name = name
        self.direct_dependencies = [*dependencies]
        self.dependencies = [*dependencies]
        self.interdependence = False

    def add_dependencies(self, dependencies):
        self.dependencies.extend(dependencies)

    def is_dependent(self, name):
        return name in self.dependencies

    def is_interdependence(self):
        return self.interdependence

    def set_interdependence(self):
        self.interdependence = True

    def get_require_name(self, imported_names, dependencies):
        temp_imported_names = [*imported_names]
        dependency_name_stack = [*self.direct_dependencies]
        while len(dependency_name_stack) > 0:
            dependency_name = dependency_name_stack.pop(0)
            if dependency_name not in temp_imported_names:
                return dependency_name

            imported_names.append(dependency_name)

            dependency = next(iter(
                dependency
                for dependency
                in dependencies
                if dependency.name == dependency_name
            ), None)
            if dependency is None:
                continue

            if dependency.is_interdependence:
                return dependency.name

            dependency_name_stack.insert(0, *dependency.direct_dependencies)

        return None

class ImportResult:
    def __init__(self, result, error_message):
        self.result = result
        self.error_message = error_message

def dry_import(import_names, dependencies):
    import_result = None

    imported_names = []
    for import_name in import_names:
        dependency = next(iter(dependency for dependency in dependencies if dependency.name == import_name), None)
        if dependency is None:
            imported_names.append(import_name)
            continue

        require_names = [d for d in dependency.dependencies if d not in imported_names]
        if len(require_names) == 0:
            imported_names.append(import_name)
            continue

        require_name = dependency.get_require_name(imported_names, dependencies)
        error_message = f'Import error: tried to import {import_name} but {require_name} is required.'

        import_result = ImportResult(result=False, error_message=error_message)
        break

    return import_result or ImportResult(result=True, error_message=None)

def reorder_import(import_names, dependencies):
    reorder_import_names = []

    sorted_import_names = sorted(import_names)
    while len(sorted_import_names) > 0:
        importable_name = None
        for import_name in sorted_import_names:
            dependency = next(iter(dependency for dependency in dependencies if dependency.name == import_name), None)
            if dependency is None or all(d in reorder_import_names for d in dependency.dependencies):
                importable_name = import_name
                break

        if importable_name is None:
            return []

        reorder_import_names.append(importable_name)
        sorted_import_names.remove(importable_name)

    return reorder_import_names

dependencies = []
for dependency in dependency_rows:
    require_from, require_to = dependency.split(' requires ')
    dependencies.append(Dependency(require_from, require_to.split(', ')))

for dependency in dependencies:
    caller_dependencies = [d for d in dependencies if d.is_dependent(dependency.name)]
    for caller_dependency in caller_dependencies:
        if dependency.is_dependent(caller_dependency.name):
            caller_dependency.set_interdependence()
            for d in dependencies:
                if d.is_dependent(caller_dependency.name):
                    d.set_interdependence()

        caller_dependency.add_dependencies(dependency.dependencies)

import_names = [import_row.removeprefix('import ') for import_row in import_rows]

dry_run_result = dry_import(import_names, dependencies)

results = []
if dry_run_result.result:
    results = ['Compiled successfully!']
else:
    is_inter_dependencies = False
    for import_name in import_names:
        dependency = next(iter(dependency for dependency in dependencies if dependency.name == import_name), None)
        if dependency is not None and dependency.is_interdependence():
            is_inter_dependencies = True
            break

    if is_inter_dependencies:
        results = [dry_run_result.error_message, 'Fatal error: interdependencies.']
    else:
        reorder_imports = [f'import {import_name}' for import_name in reorder_import(import_names, dependencies)]

        results = [
            dry_run_result.error_message,
            'Suggest to change import order:',
            *reorder_imports,
        ]

# print("answer")
for result in results:
    print(result)
