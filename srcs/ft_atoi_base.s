		section	.text
		global	_ft_atoi_base

_ft_atoi_base_error:
		push	rbp
		mov		rbp, rsp
		xor		dh, dh
		mov		r8, rdi

_ft_atoi_base_error_do1:
		mov		r10, [r8]
		cmp		r10, 0
		je		_ft_atoi_base_error_end
		xor		dl, dl
		mov		r9, rdi

_ft_atoi_base_error_do2:
		mov		r10, [r9]
		cmp		r10, 0
		je		_ft_atoi_base_error_next1

		mov		rsi, r8
		mov		ch, BYTE [rsi]
		mov		rsi, r9
		mov		cl, BYTE [rsi]
		cmp		ch, cl
		jne		_ft_atoi_base_error_next2
		cmp		dh, dl
		je		_ft_atoi_base_error_next2
		mov		al, dl
		jmp		_ft_atoi_base_error_end

_ft_atoi_base_error_next2:
		inc		r9
		inc		dl
		jmp		_ft_atoi_base_error_do2

_ft_atoi_base_error_next1:
		inc		r8
		inc		dh
		jmp		_ft_atoi_base_error_do1

_ft_atoi_base_error_end:
		leave
		ret


_ft_atoi_base:
		push	rbp
		mov		rbp, rsp

		xchg	rdi, rsi
		call	_ft_atoi_base_error

_end:
		leave
		ret