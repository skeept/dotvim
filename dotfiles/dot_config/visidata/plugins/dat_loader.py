from visidata import CsvSheet, Column, VisiData
from datetime import datetime
import csv

import sys
from pathlib import Path
import logging


sys.path.append("/wrk/or/utils/src")  # for data_names
from data_names import get_schema_and_csv


logger = logging.getLogger(__name__)


def no_header_to_csv(path: Path) -> tuple[list[str], list[list[str]]]:
    """Convert to csv with simple col schema."""
    header = []
    rows = []
    max_len = 0
    with path.open(newline="") as fd:
        reader = csv.reader(fd)
        for row in reader:
            max_len = max(max_len, len(row))
            rows.append(row)
    header = [f"c{i + 1:02}" for i in range(max_len)]
    return header, rows


class DatSheet(CsvSheet):
    """Custom loader for .dat files."""

    delimiter = ","  # or ',' or '|' — adjust to your format
    hasHeaders = True

    def reload(self):
        """Given the name get the schema and produce csv on the fly."""

        try:
            _schema, all_rows = get_schema_and_csv(self.sourcePath.resolve())
            rows_iter = iter(all_rows)
            header = next(rows_iter)  # don't add header to rows?
        except Exception:
            logger.exception(f"failed to load {self.sourcePath}")
            header, all_rows = no_header_to_csv(self.sourcePath)
            rows_iter = iter(all_rows)
        self.rows = []
        for row in rows_iter:
            self.addRow(row)

        for idx, col in enumerate(self.columns):
            col.name = header[idx] if idx < len(header) else f"c{idx + 1:02}"

            # for now skip setting type but we scan do that based on _schema
            # self.columns[2].type = datetime


@VisiData.api
def open_dat(vs_, p):
    return DatSheet(p.name, sourcePath=p)
