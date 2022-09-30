#! /bin/bash
# Clean the each values from each data record.
clean_data() {
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
    done < <(tail -n +2 $1)
}
clean_data Walmart.csv