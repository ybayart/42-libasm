# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_atoi_base.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/11 15:47:59 by ybayart           #+#    #+#              #
#    Updated: 2019/12/11 16:06:12 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section	.text
		global	_ft_atoi_base

_ft_atoi_base_error:
		push	rbp
		mov		rbp, rsp
		xor		ch, ch
		xor		rax, rax
		mov		r8, rdi

_ft_atoi_base_error_do1:
		mov		al, BYTE [rdi]
		cmp		al, 0
		je		_ft_atoi_base_error_success
		cmp		al, 9
		je		_ft_atoi_base_error_error
		cmp		al, 10
		je		_ft_atoi_base_error_error
		cmp		al, 11
		je		_ft_atoi_base_error_error
		cmp		al, 12
		je		_ft_atoi_base_error_error
		cmp		al, 13
		je		_ft_atoi_base_error_error
		cmp		al, ' '
		je		_ft_atoi_base_error_error
		cmp		al, '-'
		je		_ft_atoi_base_error_error
		cmp		al, '+'
		je		_ft_atoi_base_error_error
		xor		cl, cl
		mov		rsi, r8

_ft_atoi_base_error_do2:
		mov		ah, BYTE [rsi]
		cmp		ah, 0
		je		_ft_atoi_base_error_next1


		mov		ah, BYTE [rdi]
		mov		al, BYTE [rsi]
		cmp		ah, al
		jne		_ft_atoi_base_error_next2
		cmp		ch, cl
		je		_ft_atoi_base_error_next2
		jmp		_ft_atoi_base_error_error

_ft_atoi_base_error_next2:
		inc		rsi
		inc		cl
		jmp		_ft_atoi_base_error_do2

_ft_atoi_base_error_next1:
		inc		rdi
		inc		ch
		jmp		_ft_atoi_base_error_do1

_ft_atoi_base_error_success:
		xor		rax, rax
		mov		al, ch

_ft_atoi_base_error_end:
		leave
		ret

_ft_atoi_base_error_error:
		mov		rax, -1
		jmp		_ft_atoi_base_error_end



_ft_atoi_base_search:
		push	rbp
		mov		rbp, rsp

		mov		rsi, rdi

		xor		rdx, rdx
		xor		rax, rax

_ft_atoi_base_search_ws:
		lodsb
		cmp		al, ' '
		je 		_ft_atoi_base_search_ws
		cmp		al, 9
		je 		_ft_atoi_base_search_ws
		cmp		al, 10
		je 		_ft_atoi_base_search_ws
		cmp		al, 11
		je 		_ft_atoi_base_search_ws
		cmp		al, 12
		je 		_ft_atoi_base_search_ws
		cmp		al, 13
		je 		_ft_atoi_base_search_ws
		jmp		_ft_atoi_base_search_mult

_ft_atoi_base_search_mult_neg:
		not		rdx

_ft_atoi_base_search_mult_lodsb:
		lodsb

_ft_atoi_base_search_mult:
		cmp		al, '-'
		je 		_ft_atoi_base_search_mult_neg
		cmp		al, '+'
		je		_ft_atoi_base_search_mult_lodsb
		cmp		rdx, -1
		je 		_ft_atoi_base_search_end

		inc		rdx

_ft_atoi_base_search_end:
		dec		rsi
		mov		rax, rdx
		leave
		ret


_ft_atoi_base_test:
		push	rbp
		mov		rbp, rsp

		xor		rcx, rcx

_ft_atoi_base_test_do:
		lodsb
		cmp		al, 0
		je 		_ft_atoi_base_test_error
		cmp		al, ah
		je 		_ft_atoi_base_test_success
		inc		rcx
		jmp		_ft_atoi_base_test_do

_ft_atoi_base_test_success:
		mov		rax, rcx
		sub		rsi, rcx
		dec		rsi

_ft_atoi_base_test_end:
		leave
		ret

_ft_atoi_base_test_error:
		mov		rax, -1
		jmp		_ft_atoi_base_test_end



_ft_atoi_base:
		push	rbp
		mov		rbp, rsp

		push	rdi			;=8
		push	rsi			;=16
		mov		rdi, rsi
		call	_ft_atoi_base_error
		pop		rsi			;=8
		pop		rdi			;=0

		cmp		rax, 2
		jl		_error

		push	rax			;=8
		push	rsi			;=16
		call	_ft_atoi_base_search
		pop		rdi			;=8
		pop		rdx			;=0
		push	rax			;=8			;1 > mult
		push	rdx			;=16		;2 > len

		xor		rax, rax
		xchg	rdi, rsi

		push	rax			;=24		;3 > nb

_ft_atoi_base_do:
		xor		rax, rax
		mov		ah, BYTE [rdi]
		inc		rdi
		push	rdi			;=32		;4 > rdi (nombre)
		call	_ft_atoi_base_test
		pop		rdi			;=24		;rdi
		pop		rdx			;=16		;nb
		pop		r8			;=8			;len
		pop		r9			;=0			;mult

		xchg	rdx, rax

		cmp		rdx, -1
		je		_success

		push	rdx
		sub		rsp, 8
		mul		r8
		add		rsp, 8
		pop		rdx
		add		rax, rdx
		push	r9			;=8			;1 > mult
		push	r8			;=16		;2 > len
		push	rax			;=24		;3 > nb
		jmp		_ft_atoi_base_do

_success:
		mul		r9

_end:
		leave
		ret

_error:
		mov		rax, 0
		jmp		_end
