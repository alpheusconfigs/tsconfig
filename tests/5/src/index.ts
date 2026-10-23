type AddOptions = {
    a: number;
    b: number;
};

const add = (options: AddOptions): number => {
    return options.a + options.b;
};

export type { AddOptions };
export { add };
