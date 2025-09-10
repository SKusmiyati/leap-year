clc; clear;

disp('=== LEAP YEAR CALCULATOR ===');
disp('1. Cek apakah tahun kabisat atau tidak (1 input)');
disp('2. Cari semua tahun kabisat dalam rentang tertentu (2 input)');
disp('3. Cari tahun kabisat setelah tahun tertentu (1 input)');
mode = input('Pilih mode (1/2/3): ');

switch mode
    case 1
        % Mode 1: satu tahun
        year = input('Masukkan tahun: ');
        if isLeapYear(year)
            fprintf('%d adalah tahun kabisat.\n', year);
        else
            fprintf('%d BUKAN tahun kabisat.\n', year);
        end

    case 2
        % Mode 2: range tahun
        startYear = input('Masukkan tahun awal: ');
        endYear = input('Masukkan tahun akhir: ');
        
        fprintf('Tahun kabisat antara %d - %d:\n', startYear, endYear);
        leapYears = [];
        for y = startYear:endYear
            if isLeapYear(y)
                leapYears(end+1) = y; 
            end
        end
        if isempty(leapYears)
            disp('Tidak ada tahun kabisat di rentang tersebut.');
        else
            disp(leapYears);
        end

    case 3
        % Mode 3: cari kabisat setelah tahun tertentu
        year = input('Masukkan tahun: ');
        nextYear = year + 1;
        while ~isLeapYear(nextYear)
            nextYear = nextYear + 1;
        end
        fprintf('Tahun kabisat setelah %d adalah %d.\n', year, nextYear);

    otherwise
        disp('Pilihan tidak valid!');
end

% --- Fungsi pengecek kabisat ---
function tf = isLeapYear(year)
    if mod(year,400) == 0
        tf = true;
    elseif mod(year,100) == 0
        tf = false;
    elseif mod(year,4) == 0
        tf = true;
    else
        tf = false;
    end
end
