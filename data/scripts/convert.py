
import sys
import csv


def main():

    if len(sys.argv) != 3:
        print("Uaage: csv_convert.py --file [filename]")
        exit(-1)

    file = sys.argv[2]

    loadfile(file)


def loadfile(file):
    with open(file, newline='') as csv_file:
        reader = csv.reader(csv_file)
        for row in reader:

            section_id = row[0]
            item_id = row[1]
            section_name = row[2]
            item_name = row[3]
            item_description = row[4]

            if item_id.isdigit() is not True:
                print('Expected int for item_id')
                exit(-1)

            if section_id.isdigit() is not True:
                print('Expected int for section_id')
                exit(-1)

            section_id = section_id.replace('"', '')
            item_id = item_id.replace('"', '')
            section_name = section_name.replace('"', '')
            item_name = item_name.replace('"', '')
            item_description = item_description.replace('"', '')

            print("[\"section_id\": " + "\"" + section_id + "\"", end=', ')
            print("\"item_id\": " + "\"" + item_id + "\"", end=', ')
            print("\"section_name\": " + "\"" + section_name + "\"", end=', ')
            print("\"item_name\": " + "\"" + item_name + "\"", end=', ')
            print("\"item_description\": " + "\"" + item_description + "\"", end='],')
            print()


if __name__ == "__main__":
    main()
