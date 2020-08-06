from validations.main import process_data
import argparse


def run():
    parser = argparse.ArgumentParser(description='Local validation pipeline')
    parser.add_argument('-o', '--output_dir', type=str, metavar='', required=False,
                        default="C:\\Users\\*\\*\\output_folder",
                        help='location for output files on surface pro, '
                             'preface location with r and encase path in double quotes')
    parser.add_argument('-j', '--json_file', type=str, metavar='', required=False,
                        default="unit_test_1.0.json",
                        help='json_file that matches your data dictionary, single file')
    parser.add_argument('-f', '--file_path', type=str, metavar='', required=False,
                        default=r"dummy_data\\*.csv",
                        help='location of folder containing files, '
                             'preface location with r and encase path in double quotes')

    args = parser.parse_args()

    output_dir = args.output_dir
    json_file = args.json_file
    file_path = args.file_path

    print('output_dir = ', output_dir, 'json_file = ', json_file, 'file_path = ', file_path)

    process_data(file_path, output_dir, json_file)


if __name__ == '__main__':

    run()



