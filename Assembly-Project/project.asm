.MODEL SMALL
.STACK 100h


.DATA
    array DB 5, 3, 8, 1, 4, 2, 7, 6 
   
    
    
.CODE

  MAIN PROC FAR
  
  .STARTUP

    MOV CX, 7                ; Set CX to the number of elements - 1

    outer_loop:
    MOV SI, 1                ; Start at the second element

    inner_loop:
    MOV DI, SI               ; DI points to the current element
    DEC DI                   ; Move DI back to the previous element

    MOV AL, [SI]                 
    MOV BL, [DI]                 

    
    CMP BL, AL
    JLE no_swap              ; If the previous element <= current element, no swap needed

             
    ; Swap the elements   
    MOV [SI], BL             
    MOV [DI], AL

    no_swap:
    INC SI                            
    CMP SI, CX
    JLE inner_loop                    

    LOOP outer_loop                  

    
    ; Print the sorted array
    MOV SI, 0
    
    print_loop:
    MOV AL, [SI]                 
    CALL print_char                  
    MOV AH, 02h
    MOV DL, ' '                      
    INT 21h
    INC SI
    CMP SI, 8
    JL print_loop

   
    .EXIT
    MAIN ENDP

    print_char PROC NEAR
    
    ADD AL, 30h                       
    MOV AH, 0Eh                       
    INT 10h
    RET
    
    print_char ENDP

  END MAIN
