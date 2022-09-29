#!/bin/bash
# Using the read command to read the line-break (\n) separated records of dataset.
while read line
do
   echo "Record is : $line"
done < Walmart.csv

#!/bin/bash
# Updating the record after excluding the header line from the output.
while read line
do
   echo "Record is : $line"
done < <(tail -n +2 Walmart.csv)

#! /bin/bash
# Read the values from each data record.
while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4 rec_column5 rec_column6 rec_column7 rec_column8
do
  echo "Displaying Record for Store-$rec_column1"
  echo "Date: $rec_column2"
  echo "Weekly Sales: $rec_column3"
  echo "Holiday(1) or Non-holiday (0): $rec_column4"
  echo "Temperature: $rec_column5"
  echo "Fuel Price: $rec_column6"
  echo "CPI: $rec_column7"
  echo "Unemployment: $rec_column8"
  echo ""
done < <(tail -n +2 Walmart.csv)

#! /bin/bash
# Mapping Columns of CSV File into Bash Arrays
arr_record1=( $(tail -n +2 Walmart.csv | cut -d ',' -f1) )
arr_record2=( $(tail -n +2 Walmart.csv | cut -d ',' -f2) )
arr_record3=( $(tail -n +2 Walmart.csv | cut -d ',' -f3) )
arr_record4=( $(tail -n +2 Walmart.csv | cut -d ',' -f4) )
arr_record5=( $(tail -n +2 Walmart.csv | cut -d ',' -f5) )
arr_record6=( $(tail -n +2 Walmart.csv | cut -d ',' -f6) )
arr_record7=( $(tail -n +2 Walmart.csv | cut -d ',' -f7) )
echo "array of Store : ${arr_record1[@]}"
echo "array of Date : ${arr_record2[@]}"
echo "array of Weekly Sales: ${arr_record3[@]}"
echo "array of Holiday(1) or Non-holiday (0) : ${arr_record4[@]}"
echo "array of Temperature : ${arr_record5[@]}"
echo "array of CPI : ${arr_record6[@]}"
echo "array of Unemployment : ${arr_record7[@]}"