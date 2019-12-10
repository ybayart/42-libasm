# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_remove_if.s                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/10 06:11:51 by ybayart           #+#    #+#              #
#    Updated: 2019/12/10 06:11:52 by ybayart          ###   ########.fr        #
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

		xor		r10, r10					;end = 0
		mov		r8, [rdi]					;list = *begin_list

_do1:
		cmp		r10, 0
		jne		_first
		mov		r10, 1						;end = 1

_do2:
		cmp		r8, 0						;list == NULL
		je		_next1
		mov		r9, [r8+8]					;list->next == NULL
		cmp		r9, 0
		je		_next1
		cmp		r10, 1						;end != 1
		jne		_next1

		xchg	r9, rdi						;rdi = list->next
		mov		rdi, [rdi]					;rdi = list->next->data

		push	rdx		;=8
		push	rsi		;=16
		push	r9		;=24
		push	r8		;=32
		push	r10		;=40
		push	rcx		;=48
		sub		rsp, 8	;=56
		call	rdx							;(*cmp)()
		add		rsp, 8	;=48
		pop		rcx		;=40
		pop		r10		;=32
		pop		r8		;=24

		cmp		rax, 0
		jne		_next2

		mov		r10, 0						;end = 0

		mov		rdi, [r8+8]					;rdi = list->next
		mov		r11, [rdi+8]				;tmp = list->next->next
		mov		[r8+8], r11					;list->next = list->next->next
		
		push	r8		;=32
		push	r10		;=40
		push	rcx		;=48

		mov		r8, rdi
		mov		rdi, [rdi]
		push	r8		;=54
		sub		rsp, 8	;=48
		call	rcx
		add		rsp, 8	;=56
		pop		rdi		;=48
		call	_free
		pop		rcx		;=40
		pop		r10		;=32
		pop		r8		;=24

_next2:
		pop		r9		;=16
		pop		rsi		;=8
		pop		rdx		;=0
		xchg	rdi, r9
		mov		r8, [r8+8]
		jmp		_do2

_next1:
		mov		r8, [rdi]
		jmp		_do1

_first:
		mov		r9, [r8]
		xchg	r9, rdi			
		push	r9		;=8
		push	r8		;=16
		push	rcx		;=24
		sub		rsp, 8	;=16
		call	rdx
		add		rsp, 8	;=24
		pop		rcx		;=16
		pop		r8		;=8
		pop		r9		;=0

		cmp		rax, 0
		jne		_end

		;r8  = list
		;r9  = *begin_list
		mov		r10, [r9]
		mov		r10, [r10+8]
		mov		[r9], r10
		mov		rdi, [r8]

		push	r8
		sub		rsp, 8
		call	rcx
		add		rsp, 8
		pop		r8

		mov		rdi, r8
		call	_free


_end:
		leave
		ret
