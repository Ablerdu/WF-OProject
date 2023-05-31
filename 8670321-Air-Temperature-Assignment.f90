PROGRAM ConvertTemperatures                                                     ! start of program

! This program calculates converts temperature values from celcius to kelvin by reading and writing the data from Air-temperature.csv  in same directory

    IMPLICIT NONE 
    INTEGER :: i, ios                                                           !Counter for loop and iostat respectively
    REAL :: temperature, kelvin                                                 ! Temperature and kelvin 
    CHARACTER(len=20) :: input_file                                             ! input file
    CHARACTER(len=40) :: output_file                                            ! Output file
    
    
    input_file = 'Air-Temperature.csv'                                         ! Input file assigned to Air-temperature.csv
    
    WRITE(output_file, '(I8)') 8670321                                         ! Write the index number to the outputfile
    output_file = trim(output_file) // '-Air-Temperature-Assignment.csv'       !Appending '-Air-Temperature-Assignment.csv' to the output file name
    
    OPEN(unit=10, file=input_file, status='old', action='read', iostat=ios)    ! open the input file for reading
    
     ! If the condition ios /= 0 is true, it indicates an error in opening the file
    IF (ios /= 0) THEN
        WRITE(*,*) 'Error opening file: ', input_file                           ! Display an error message along with the input file name
        STOP                                                                    ! Stop the program execution if there is an error
    END IF
    
    OPEN(unit=20, file=trim(output_file), status='replace', action='write', iostat=ios)   ! open output file for writing
    
     ! If the condition ios /= 0 is true, it indicates an error in opening the file
    IF (ios /= 0) THEN 
        WRITE(*,*) 'Error opening file: ', trim(output_file)                    ! Display an error message along with the input file name
        STOP                                                                    ! Stop the program execution if there is an error
    END IF
    
    WRITE(20, '(A, A)') 'Celsius, Kelvin'                                        ! Print header of Celsius and Kelvin for output data
    
    DO i = 1, 10
        READ(10, *, iostat=ios) temperature                                     ! Read temperature from file
        IF  (ios /= 0) THEN
             WRITE(*,*) 'Error reading temperature from file: ', input_file     ! Display error messages if reading fails
             STOP
        END IF
        kelvin = temperature + 273.15                                           ! convert temperature to kelvin
        WRITE(20, '(F10.2, F10.2)') temperature, kelvin                         ! Write the temperature values in celsius and kelvin to output file
    END DO
    
    CLOSE(10)                                                                   ! Close the input file
    CLOSE(20)                                                                   ! Close the output file
    
    WRITE(*, *) 'Output data saved to file: ', trim(output_file)
    
END PROGRAM ConvertTemperatures                                                 ! End of program
