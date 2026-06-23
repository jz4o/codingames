# import sys
# import math

# Decode and execute the MiniCPU bytecode program.

program = input()  # Space-separated hex bytes representing CPU instructions

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class MiniCpu:
    REGISTER_NUMBERS = ['00', '01', '02', '03']

    @classmethod
    def exec(cls, program):
        cls.register = dict.fromkeys(cls.REGISTER_NUMBERS, 0)

        program_bytes = program.split()
        while len(program_bytes) > 0:
            instruction = program_bytes.pop(0)
            if instruction == cls.Instruction.HLT:
                break

            if instruction in [cls.Instruction.INC, cls.Instruction.DEC]:
                register_number = program_bytes.pop(0)
                cls.instruction_to_method(instruction)(register_number)

            elif instruction in [cls.Instruction.MOV, cls.Instruction.ADD, cls.Instruction.SUB, cls.Instruction.MUL]:
                register_number = program_bytes.pop(0)
                value = program_bytes.pop(0)
                if instruction == cls.Instruction.MOV:
                    value = int(value, 16)

                cls.instruction_to_method(instruction)(register_number, value)

        return [
            cls.register[register_number] % 256
            for register_number
            in cls.REGISTER_NUMBERS
        ]

    @classmethod
    def mov(cls, register_number, value):
        cls.register[register_number] = value

    @classmethod
    def add(cls, register_number1, register_number2):
        cls.register[register_number1] += cls.register[register_number2]

    @classmethod
    def sub(cls, register_number1, register_number2):
        cls.register[register_number1] -= cls.register[register_number2]

    @classmethod
    def mul(cls, register_number1, register_number2):
        cls.register[register_number1] *= cls.register[register_number2]

    @classmethod
    def inc(cls, register_number):
        cls.register[register_number] += 1

    @classmethod
    def dec(cls, register_number):
        cls.register[register_number] -= 1

    @classmethod
    def instruction_to_method(cls, instruction):
        return {
            cls.Instruction.MOV: cls.mov,
            cls.Instruction.ADD: cls.add,
            cls.Instruction.SUB: cls.sub,
            cls.Instruction.MUL: cls.mul,
            cls.Instruction.INC: cls.inc,
            cls.Instruction.DEC: cls.dec,
        }[instruction]


    class Instruction:
        MOV = '01'
        ADD = '02'
        SUB = '03'
        MUL = '04'
        INC = '05'
        DEC = '06'
        HLT = 'FF'

results = MiniCpu.exec(program)

# Print the final value of each register R0, R1, R2, R3, one value per line
# print("answer")
for result in results:
    print(result)
