#-----------------------------------------------------------------------------------------------------------------------------
# ALUNO: ENZO GUIDO AMERICANO DA COSTA       MATRICULA: 202000560432
#-----------------------------------------------------------------------------------------------------------------------------

.data #contém as mensagens de texto que serão printadas no programa

msg1: .asciiz "Entre o valor inteiro positivo 'A' = "
msg2: .asciiz "Entre o valor inteiro positivo 'B' = "
msg3: .asciiz "\nAmbos os valores digitados precisam, necessariamente, serem maiores que 0.\n\n"
msg4: .asciiz "° multiplo = "
msg5: .asciiz "\n"

.text #contém as funções que serão utilizadas no programa

main: #contém as funções que serão utilizadas no programa
	add $t0,$zero,$zero #zera o valor contido em $t0, $t0 irá armazenar o valor A inserido
	add $t1,$zero,$zero #zera o valor contido em $t1, $t1 irá armazenar o valor B inserido
	add $t2,$zero,$zero #zera o valor contido em $t2, $t2 irá servir como contador da multiplicação (1 até B)
	add $t3,$zero,$zero #zera o valor contido em $t3, $t3 irá armazenar a multiplicação entre A e t2 (contador)
	j read #pula para a branch "read"
	
	read: #branch read, realiza a leitura de A e B que será inserido no terminal
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg1 #carrega o endereço de msg1 em a0
		syscall #emite uma chamada do sistema
		li $v0,5 #código syscall para ler inteiros, fará a leitura de A
		syscall #emite uma chamada do sistema
		add $t0,$v0,$zero #valor de $t0 recebe $v0 (A)
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg2 #carrega o endereço de msg2 em a0
		syscall #emite uma chamada do sistema
		li $v0,5 #código syscall para ler inteiros, fará a leitura de B
		syscall #emite uma chamada do sistema
		add $t1,$v0,$zero #valor de $t1 recebe $v0 (B)
		j compare #pula para a branch "compare"
		
		
	compare: #compara se o valor contido em $t0 (A ou B) é maior do que zero
		add $k0,$zero,$zero #zera o valor contido em $k0, $k0 irá servir como condicional para caso A > 0
		add $k0,$t0,$zero #k0 recebe o valor de t0 (A)
		blez $k0,error #caso o valor em $k0 seja menor ou igual a 0, pula para a branch "error"
		add $k1,$zero,$zero #zera o valor contido em $k1, $k1 irá servir como condicional para caso B > 0
		add $k1,$t1,$zero #k1 recebe o valor de t1 (B)
		blez $k1,error #caso o valor em $k1 seja menor ou igual a 0, pula para a branch "error"
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg5 #carrega o endereço de msg5 em a0
		syscall #emite uma chamada do sistema
		j multiples #pula para a branch "factorial" caso o valor A em $t0 e B em $t1 sejam válidos
		
	error: #caso o valor N inserido em $t0 seja menor ou igual a zero
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg3 #carrega o endereço de msg3 em a0
		syscall #emite uma chamada do sistema
		j read #pula para a branch "read", realiza outra leitura de N até ser um valor válido
		
	multiples: #loop de multiplicação de A por contador ($t2) até B
		add $t2,$t2,1 #adiciona 1 ao contador
		mul $t3,$t0,$t2 #como o contador também representa a sequência dos numeros naturais até B, $t3 recebe o valor de $t0 (A) vezes o valor de $t2 (contador até B)
		j message #pula para a branch "message"
		
	message: #imprime o valor em $t2 (contador), com o valor do enredeço de msg4 e o valor em $t3(multiplicação entre A e t2 (contador))
		li $v0,1 #código syscall para imprimir inteiros
		add $a0,$t2,$zero #$a0 recebe o valor de $t2 (contador dos valores inteiros de 1 até B) e imprime no terminal
		syscall #emite uma chamada do sistema
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg4 #carrega o endereço de msg4 em a0
		syscall #emite uma chamada do sistema
		li $v0,1 #código syscall para imprimir inteiros
		add $a0,$t3,$zero #$a0 recebe o valor de $t3 (multiplicação entre A e t2 (contador)) e imprime no terminal
		syscall #emite uma chamada do sistema
		li $v0,4 #código syscall para imprimir strings
		la $a0,msg5 #carrega o endereço de msg5 em a0
		syscall #emite uma chamada do sistema
		bne $t2,$t1,multiples #caso $t2 (contador) seja diferente de $t1 (B) volta para a branch multiplies, até ser igual e terminar o programa
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		