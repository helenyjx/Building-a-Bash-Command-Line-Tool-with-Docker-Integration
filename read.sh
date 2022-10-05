#! /bin/bash
# Using the read command to read the line-break (\n) separated records of dataset.
read_record() {
    while read line
    do
      echo "Record is : $line"
    done < $1
}
read_record Walmart.csv

