
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

            topic_name = row[0]
            topic_description = row[1]

            topic_name = topic_name.replace('"', '')
            topic_description = topic_description.replace('"', '')

            print("INSERT INTO Topic VALUES (" + "NULL" + ", '" + topic_name + "', '" + topic_description + "');")

            # section_id = section_id.replace('"', '')
            # item_id = item_id.replace('"', '')
            # section_name = section_name.replace('"', '')
            # item_name = item_name.replace('"', '')

            # print("[\"section_id\": " + "\"" + section_id + "\"", end=', ')
            # print("\"item_id\": " + "\"" + item_id + "\"", end=', ')
            # print("\"section_name\": " + "\"" + section_name + "\"", end=', ')
            # print("\"item_name\": " + "\"" + item_name + "\"", end=', ')
            # print("\"item_description\": " + "\"" + item_description + "\"", end='],')
            # print()


if __name__ == "__main__":
    main()
