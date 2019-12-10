# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_remove_if.s                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/10 01:04:59 by ybayart           #+#    #+#              #
#    Updated: 2019/12/10 05:28:17 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

;	rdi: **begin_list
;	rsi: *data_ref
;	rdx: (*cmp)()
;	rcx: (*free_fct)(void *)

		section	.text
		global	_ft_list_remove_if
		extern	_free

_ft_list_remove_if:
		push	rbp
		mov		rbp, rsp

		mov		r8, [rdi]

_do:
		cmp		r8, 0						;list == NULL
		je		_end
		mov		r9, [r8+8]					;list->next == NULL
		cmp		r9, 0
		je		_end

		xchg	r9, rdi
		mov		rdi, [rdi]

		push	rdx		;=8
		push	rsi		;=16
		push	r9		;=24
		push	r8		;=32
		push	rdi		;=40
		push	rcx		;=48
		call	rdx							;(*cmp)()
		pop		rcx		;=40
		pop		rdi		;=32
		pop		r8		;=24

		cmp		rax, 0
		jne		_next

		mov		rdi, [r8+8]
		mov		r10, [rdi+8]
		mov		[r8+8], r10
		
		push	r8		;=32
		push	rdi		;=40

		mov		r8, rdi
		mov		rdi, [rdi]
		push	r8		;=48
		call	rcx
		pop		r8		;=40
		mov		rdi, r8
		sub		rsp, 8	;=32
		call	_free
		add		rsp, 8	;=40
		pop		rdi		;=32
		pop		r8		;=24

_next:
		pop		r9		;=16
		pop		rsi		;=8
		pop		rdx		;=0
		xchg	rdi, r9
		mov		r8, [r8+8]
		jmp		_do

_end:
		leave
		ret
