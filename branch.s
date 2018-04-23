main:
slt $8, $0, $1;
add $1, $0, $0;
addi $2, $0, 0x2;
xor $5, $0, $2;
add $3, $0, $2;
sub $6, $3, $2;
lui $4, 0x4;
sw $4, 0($0);
lw $7, 0($0);
add $9, $0, $7;
beq $1, $0, next;
j main;
next:
addi $1, $0, 0x10;
j main;