from visidata import CsvSheet, Column, VisiData
from datetime import datetime
import csv


class DatSheet(CsvSheet):
    """Custom loader for .dat files."""

    delimiter = ","  # or ',' or '|' — adjust to your format
    hasHeaders = True

    def reload(self):
        self.rows =  []
        print(self.rows)
        with self.sourcePath.open(newline="") as fd:
            csvreader = csv.reader(fd)
            for row in csvreader:
                self.addRow(row)
        for idx, col in enumerate(self.columns, 1):
            col.name = f"c_{idx:02}"

        self.columns[2].type = datetime


@VisiData.api
def open_dat(vs_, p):
    return DatSheet(p.name, sourcePath=p)
