from scipy.io import loadmat, savemat
import pprint
import os


def load_data(data_file):
    data = loadmat(data_file)
    return data["datasetInputs"], data["datasetTargets"]


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description="Neural Network.")
    parser.add_argument("data", type=str, help="the data file")

    args = parser.parse_args()

    inputs, targets = load_data(args.data)
    pp = pprint.PrettyPrinter(indent=4)

    pp.pprint("Inputs")
    pp.pprint(inputs)
    pp.pprint("Targets")
    pp.pprint(targets)
