#! /bin/bash
# Sorting the record after excluding the header line from the output.
sort_record_no_header() {
    while read line
    do
      echo "Record is : $line"
    done < <(tail -n +2 $1)
}
sort_record_no_header Walmart.csv
