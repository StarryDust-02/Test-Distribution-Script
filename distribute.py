import os
import csv
import shutil

# Relative paths (assume script is at project root)
LIBRARY_DIR = "library"
DATABASE_DIR = "database"
OUTPUT_DIR = "output"

def distribute_tests():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    for csv_file in os.listdir(DATABASE_DIR):
        if not csv_file.endswith(".csv"):
            continue

        csv_path = os.path.join(DATABASE_DIR, csv_file)
        class_name = os.path.splitext(csv_file)[0]
        class_output_dir = os.path.join(OUTPUT_DIR, class_name)
        os.makedirs(class_output_dir, exist_ok=True)

        with open(csv_path, newline="", encoding="utf-8") as f:
            reader = csv.DictReader(f)
            for row in reader:
                student = row["student"].strip()
                test_file = row["test file"].strip()

                student_dir = os.path.join(class_output_dir, student)
                os.makedirs(student_dir, exist_ok=True)

                src_file = os.path.join(LIBRARY_DIR, test_file)
                dst_file = os.path.join(student_dir, test_file)

                if os.path.exists(src_file):
                    shutil.copy(src_file, dst_file)
                    print(f"Copied {test_file} to {student_dir}")
                else:
                    print(f"WARNING: Test file {test_file} not found in library!")

if __name__ == "__main__":
    distribute_tests()
