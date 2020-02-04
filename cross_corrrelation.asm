;Okan Dönmez
;150170708


segment .text 

segment .data      

global cross_correlation_asm_full: 			; EntryPoint

cross_correlation_asm_full:		; Main Cross Correlation Function
        push    ebp
        mov     ebp, esp
                                        
        push    edi                                     
        push    esi
                                             
        push    ebx                                     
        sub     esp, 76
                                         
        mov     eax, esp                                
        mov     dword [ebp-40H], eax                    
        mov     dword [ebp-34H], 0
                              
        mov     eax, dword [ebp+0CH]                    
        imul    eax, dword [ebp+14H]                    
        mov     dword [ebp-30H], eax
                            
        mov     eax, dword [ebp-30H]
                            
        lea     edx, [eax-1H]                           
        mov     dword [ebp-2CH], edx  
                          
        shl     eax, 2                                  
        lea     edx, [eax+3H]
                                   
        mov     eax, 16
                                         
        sub     eax, 1                                  
        add     eax, edx                                
        
        mov     edi, 16                                 
        mov     edx, 0                                  
        
        div     edi                                     
        imul    eax, eax, 16                            
        
        sub     esp, eax                                
        lea     eax, [esp+14H]                          
        
		add     eax, 3                                  
        shr     eax, 2                                  
        shl     eax, 2                                  
        mov     dword [ebp-28H], eax                    
        mov     ebx, dword [ebp+0CH]                    
        mov     edi, dword [ebp+1CH]                    
        
        lea     eax, [ebx-1H]                           
        mov     dword [ebp-24H], eax                    
        
        lea     eax, [edi-1H]                           
        mov     dword [ebp-20H], eax                    
        mov     dword [ebp-3CH], ebx                    
        
        mov     eax, ebx                                
        
        mov     edx, 0                                  
        
        mov     ecx, edi                                
        
        mov     ebx, 0                                  
        
        mov     esi, edx                                
        imul    esi, ecx                                
        
        mov     dword [ebp-44H], esi                    
        
        mov     esi, ebx                                
        imul    esi, eax                                
        add     esi, dword [ebp-44H]                    
        mul     ecx                                     
        lea     ecx, [esi+edx]                          
        
        mov     edx, ecx                                
        mov     eax, dword [ebp-3CH]                    
        mov     edx, 0                                  
        
        mov     ecx, edi                                
        
        mov     ebx, 0                                  
        
        mov     esi, edx                                
        imul    esi, ecx                                
        mov     dword [ebp-44H], esi                    
        
        mov     esi, ebx                                
        imul    esi, eax                                
        add     esi, dword [ebp-44H]                    
        
        mul     ecx                                     
        lea     ecx, [esi+edx]                          
        mov     edx, ecx                                
        mov     edx, dword [ebp-3CH]                    
        mov     eax, edi                                
        imul    eax, edx                                
        
        shl     eax, 2                                  
        lea     edx, [eax+3H]                           
        mov     eax, 16                                 
        sub     eax, 1                                  
        
        add     eax, edx                                
        mov     edi, 16                                 
        mov     edx, 0                                  
        div     edi                                     
        imul    eax, eax, 16                            
        
        sub     esp, eax                                
        lea     eax, [esp+14H]                          
        add     eax, 3                                  
        
        shr     eax, 2                                  
        shl     eax, 2                                  
        
        mov     dword [ebp-1CH], eax                    
        mov     eax, dword [ebp-28H]                    
        
        mov     dword [esp+10H], eax                    
        mov     eax, dword [ebp+14H]                    
        
        mov     dword [esp+0CH], eax                    
        mov     eax, dword [ebp+10H]                    
        
        mov     dword [esp+8H], eax                     
        mov     eax, dword [ebp+0CH]                    
        
        mov     dword [esp+4H], eax                     
        mov     eax, dword [ebp+8H]                     
        
        mov     dword [esp], eax                        
        call    iki_dizinin_carpimi                     
        
        mov     eax, dword [ebp-1CH]                    
        mov     dword [esp+8H], eax                     
        
        mov     eax, dword [ebp+0CH]                    
        mov     dword [esp+4H], eax                     
        
        mov     eax, dword [ebp+1CH]                    
        mov     dword [esp], eax                        
        
        call    diziyi_sifir_doldur                     
        
        mov     edx, dword [ebp-1CH]                    
		mov     eax, dword [ebp-28H]                    
        
        mov     dword [esp+10H], edx                    
        mov     edx, dword [ebp+1CH]                    
        
        mov     dword [esp+0CH], edx                    
        mov     dword [esp+8H], eax                     
        
        mov     eax, dword [ebp+14H]                    
        mov     dword [esp+4H], eax                     
        
        mov     eax, dword [ebp+0CH]                    
        mov     dword [esp], eax                        
        
        call    matrisi_doldur                          
        
        mov     eax, dword [ebp-1CH]                    
        mov     edx, dword [ebp+18H]                    
        
        mov     dword [esp+0CH], edx                    
        mov     dword [esp+8H], eax                     
        
        mov     eax, dword [ebp+0CH]                    
        mov     dword [esp+4H], eax                     
        
        mov     eax, dword [ebp+1CH]                    
        mov     dword [esp], eax                        
        
        call    matristen_output_hesabi                 
        mov     dword [ebp-34H], eax                    
        
        mov     eax, dword [ebp-34H]                    
        mov     esp, dword [ebp-40H]                    
        
        lea     esp, [ebp-0CH]                          
        
        pop     ebx                                     
        pop     esi                                     
        pop     edi                                     
        pop     ebp                                     
        ret                                             

                         
iki_dizinin_carpimi:		;Given the multiplication of the inverse of the index 2 element array in one dimension by function 
        push    ebp                                     
        mov     ebp, esp     
                                   
        push    ebx                                     
        sub     esp, 16                                 
        
        mov     dword [ebp-8H], 0                       
        mov     dword [ebp-10H], 0 
                             
        jmp     label_4                                  

label_1:mov     eax, dword [ebp+14H]    
                
        sub     eax, 1                                  
        mov     dword [ebp-0CH], eax                    

        jmp     label_3                                   

label_2:mov     eax, dword [ebp-8H]     
                
        lea     edx, [eax*4]                            
        mov     eax, dword [ebp+18H]                    

        add     edx, eax                                

        mov     eax, dword [ebp-10H]                    
        lea     ecx, [eax*4]                            
        mov     eax, dword [ebp+8H]                     

        add     eax, ecx                                

        mov     ecx, dword [eax]                        
        mov     eax, dword [ebp-0CH]                    
        lea     ebx, [eax*4]                            
        mov     eax, dword [ebp+10H]                    

        add     eax, ebx                                

        mov     eax, dword [eax]                        
        imul    eax, ecx                                
        mov     dword [edx], eax                        

        add     dword [ebp-8H], 1                       
        sub     dword [ebp-0CH], 1                      

label_3:cmp     dword [ebp-0CH], 0                      
        jns     label_2                                   
        add     dword [ebp-10H], 1                      
label_4:mov     eax, dword [ebp-10H]                    
        cmp     eax, dword [ebp+0CH]                    
        
        jl      label_1                                  
        
        add     esp, 16                                 
        
        pop     ebx                                     
        pop     ebp                                     
        
        ret                                             

diziyi_sifir_doldur:	 			; Assigning 0 to all elements of a given 2D array			

        push    ebp                                     
        mov     ebp, esp                                

        sub     esp, 16                                 

        mov     eax, dword [ebp+0CH]                    
        lea     edx, [eax-1H]                           

        mov     dword [ebp-4H], edx                     
        mov     dword [ebp-0CH], 0                      
        jmp     label_8                                  

label_5:mov     dword [ebp-8H], 0                       
        jmp     label_7                                   

label_6:mov     ecx, eax                                
        mov     edx, dword [ebp-0CH]       
                     
        imul    edx, ecx                                
        lea     ecx, [edx*4]                            
        mov     edx, dword [ebp+10H]                    
        
        add     ecx, edx                                
        mov     edx, dword [ebp-8H]                     
        mov     dword [ecx+edx*4], 0                    
        
        add     dword [ebp-8H], 1          
                     
label_7:mov     edx, dword [ebp-8H]                     
        cmp     edx, dword [ebp+0CH]                    
        jl      label_6                                   
        add     dword [ebp-0CH], 1                      

label_8:mov     edx, dword [ebp-0CH]                    
        cmp     edx, dword [ebp+8H]                     
        jl      label_5                                   
        leave                                           
        ret                                             


matrisi_doldur:								;fill the 2-dimensional array containing the actions that need to be done
        push    ebp                                     
        mov     ebp, esp                                
        push    ebx                                     
        sub     esp, 20                                 
        mov     eax, dword [ebp+8H]                     
        lea     edx, [eax-1H]                           
        mov     dword [ebp-0CH], edx                    
        mov     dword [ebp-18H], 0                      
        mov     dword [ebp-14H], 0                      
        jmp     label_12                                  

label_9:mov     dword [ebp-10H], 0                      
        jmp     label_11                                  

label_10:mov     edx, dword [ebp-14H]                    
        mov     ecx, dword [ebp-10H]                    
        add     edx, ecx                                
        mov     ecx, edx                                
        mov     edx, eax                                
        imul    edx, ecx                                
        lea     ecx, [edx*4]                            
        mov     edx, dword [ebp+18H]                    
        lea     ebx, [ecx+edx]                          
        mov     edx, dword [ebp-18H]                    
        lea     ecx, [edx*4]                            
        mov     edx, dword [ebp+10H]                    
        add     edx, ecx                                
        mov     ecx, dword [edx]                        
        mov     edx, dword [ebp-14H]                    
        mov     dword [ebx+edx*4], ecx                  
        add     dword [ebp-18H], 1                      
        add     dword [ebp-10H], 1                      
label_11:
		mov     edx, dword [ebp-10H]                    
        cmp     edx, dword [ebp+0CH]                    
        jl      label_10                                
        add     dword [ebp-14H], 1                      
label_12:  
		mov     edx, dword [ebp-14H]                    
        cmp     edx, dword [ebp+8H]                     
        jl      label_9                                   
        add     esp, 20                                 
        pop     ebx                                     
        pop     ebp                                     
        ret                                             


matristen_output_hesabi:						;Collect elements from each row of a 2D array and print to the output array 
        push    ebp                                     
        mov     ebp, esp                                
        sub     esp, 32                                 
        mov     eax, dword [ebp+0CH]                    
        lea     edx, [eax-1H]                           
        mov     dword [ebp-4H], edx                     
        mov     dword [ebp-8H], 0                       
        mov     dword [ebp-14H], 0                      
        jmp     label_17                                   

label_13:  
		mov     dword [ebp-0CH], 0                      
        mov     dword [ebp-10H], 0                      
        jmp     label_15                                   

label_14:  mov     ecx, eax                                
        mov     edx, dword [ebp-14H]                    
        imul    edx, ecx                                
        lea     ecx, [edx*4]                            
        mov     edx, dword [ebp+10H]                    
        add     ecx, edx                                
        mov     edx, dword [ebp-10H]                    
        mov     edx, dword [ecx+edx*4]                  
        add     dword [ebp-0CH], edx                    
        add     dword [ebp-10H], 1                      
label_15:  
		mov     edx, dword [ebp-10H]                    
        cmp     edx, dword [ebp+0CH]                    
        jl      label_14                                  
        mov     edx, dword [ebp-14H]                    
        lea     ecx, [edx*4]                            
        mov     edx, dword [ebp+14H]                    
        add     ecx, edx                                
        mov     edx, dword [ebp-0CH]                    
        mov     dword [ecx], edx                        
        cmp     dword [ebp-0CH], 0                      
        jz      label_16                                   
        add     dword [ebp-8H], 1                       
label_16:  
		add     dword [ebp-14H], 1                      
label_17:  
		mov     edx, dword [ebp-14H]                    
        cmp     edx, dword [ebp+8H]                     
        jl      label_13                                  
        mov     eax, dword [ebp-8H]                     
        leave                                           
        ret                                             


                 

 


