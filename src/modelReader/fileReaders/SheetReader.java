package modelReader.fileReaders;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import utils.Error;
import utils.ErrorType;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

public class SheetReader {
    private String fileAddress;
    private Sheet sheet;
    private int nextRow;
    private int firstColumn;
    private int lastColumn;

    SheetReader(String fileAddress) {
        this.fileAddress = fileAddress;
        Workbook workbook;
        try {
            workbook = new XSSFWorkbook(new FileInputStream(this.fileAddress));
        } catch (IOException e) {
            throw Error.combine(ErrorType.BAD_PARAMETER_FILE, this.fileAddress);
        }
        this.sheet = workbook.getSheetAt(0);
        this.firstColumn = this.sheet.getRow(0).getFirstCellNum();
        this.lastColumn = this.sheet.getRow(0).getLastCellNum();
        this.nextRow = 1;
    }


    public ArrayList<String> header() {
        return this.readLine(0);
    }

    public ArrayList<String> nextRow() {
        ArrayList<String> row = this.readLine(this.nextRow);
        this.nextRow++;
        return row;
    }

    private ArrayList<String> readLine(int i) {
        ArrayList<String> toReturn = new ArrayList<>();
        for (int j = firstColumn; j < lastColumn; j++) {
            String string = this.stringAt(i, j);
            toReturn.add(string);
        }
        return toReturn;
    }

    public boolean hasNext() {
        return nextRow <= sheet.getLastRowNum();
    }

    private String stringAt(int i, int j) {
        char c = (char) ('A' + j);
        String cellName = c + String.valueOf(i + 1);
        Row row = sheet.getRow(i);
        if (row == null) {
            return "";
        }
        Cell cell = row.getCell(j);
        if (cell == null) {
            return "";
        }
        switch (cell.getCellTypeEnum()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                return String.valueOf(cell.getNumericCellValue());
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            default:
                return "";
        }
    }


}
