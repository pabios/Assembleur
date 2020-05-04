@ Programme tabmult : Affiche les tables de multiplication de de 1 a 10
N_MAX= 10
   .data
barre :  .byte '|'
         .byte 0
espace : .byte ' '
         .byte 0
tirets : .asciz "---"

debutTab:    .skip N_MAX*N_MAX*4   @ adresse de debut du tableau

   .text
   .global main
main: push {lr}
    @ remplissage du tableau
	ldr r1, ptr_debutTab
	mov r2, #0
tq1:
	cmp r2,#N_MAX
	beq finTq1
	mov r3,#0
tq2:
	cmp r3, #N_MAX
	beq finTq2
	mul r4,r2,r3
	mov r6,#10
	mul r5,r2,r6
	mov r5,r5,lsl #2
	mov r7, r3,lsl #2
	add r5,r5,r7
	add r5,r1,r5
	str r4,[r5]
	add r3,r3,#1
	b tq2
finTq2:
	add r2,r2,#1
	b tq1
finTq1:





    @ affichage du tableau
		LDR r4, ptr_debutTab
		@ pour n_lig parcourant [0..N_MAX-1]
		MOV r2, #0
Pour1:		CMP r2, #N_MAX
		BEQ finPour1
		@ pour n_col parcourant [0..N_MAX-1]
		MOV r3, #0
Pour2:		CMP r3, #N_MAX
		BEQ finPour2
		@ ecrire_car(barre)
		LDR r1, adr_barre
		BL EcrChn
		@ mult <-- table [n_lig][n_col]
		LDR r5, [r4]
		ADD r4, r4, #4		@ decalage du pointeur d'adresse
		@ si mult < 100 alors ecrire_car(espace)
		CMP r5, #100
		BGE finsi
		LDR r1, adr_espace
		BL EcrChn
		@ si mult < 10 alors ecrire_car(espace)
		CMP r5, #10
		BGE finsi
		BL EcrChn
finsi:		@ ecrire_int(mult)
		MOV r1, r5
		BL EcrNdecim32
		ADD r3, r3, #1		@ incrementation n_col
		BAL Pour2
finPour2:	@ ecrire_car(barre)
		LDR r1, adr_barre
		BL EcrChn
		@ a_la_ligne()
		BL AlaLigne
		@ répéter N_MAX fois
		MOV r6, #0
Repeter:	CMP r6, #N_MAX
		BEQ finRepeter
		@ ecrire_car(barre)
		LDR r1, adr_barre
		BL EcrChn
		@ ecrire_chn(tirets)
		LDR r1, adr_tirets
		BL EcrChn
		ADD r6, r6, #1
		BAL Repeter
finRepeter:	@ ecrire_car(barre)
		LDR r1, adr_barre
		BL EcrChn
		BL AlaLigne
		ADD r2, r2, #1
		BAL Pour1
finPour1:

fin: pop {lr}
     bx lr

ptr_debutTab : .word debutTab
adr_barre :    .word barre
adr_espace :   .word espace
adr_tirets :   .word tirets

