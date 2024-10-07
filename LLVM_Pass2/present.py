import matplotlib.pyplot as plt

def graph(instructions):
    figure  = plt.figure(figsize=(15, 7))
    bars = plt.bar(instructions.keys(), instructions.values(), color='#76B900')

    y = [y for y in instructions.values()]
    x = [x for x in instructions.keys()]
    for i in range(len(x)):
        plt.text(i, ((y[i] / 2) if (0.15e6 < y[i]) else 0.15e6) , f"{y[i]}", ha="center", rotation=90)

    plt.grid(None, "both", "y")
    plt.title("instr <- instr_user statistic")
    plt.xticks(rotation=52, fontsize=5)
    figure.savefig('stat.png', dpi=figure.dpi)

def main():
    instructions = dict()

    file = open('tmp', 'r')
    lines = file.read().splitlines()
    for line in lines:
        if line not in instructions:
            instructions[line] = 0
        instructions[line] += 1
        
    for instr, icount in sorted(instructions.items(), key=lambda item: item[1], reverse=True):
        print(f"{instr} {icount}")

    graph(instructions)


if __name__ == "__main__":
    main()