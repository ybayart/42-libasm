# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_push_front.s                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/08 18:59:22 by ybayart           #+#    #+#              #
#    Updated: 2019/12/10 03:35:34 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

;	rdi = **begin_list
;	->	= rdx
;	rsi = *data
;	->	= rdi

		section	.text
		global	_ft_list_push_front
		extern	_ft_list_create_elem

_ft_list_push_front:
		push	rbp
		mov		rbp, rsp

		mov		rdx, rdi
		mov		rdi, rsi

		push	rdx
		push	rdi
		
		call	_ft_list_create_elem

		pop		rdi
		pop		rdx
		mov		r9, rdx
			
		mov		r10, [rdx]
		cmp		r10, 0
		je		_new
		mov		[rax+8], r10
		mov		[r9], rax

_end:
		leave
		ret

_new:
		mov		[r9], rax
		jmp		_end
