# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_size.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/09 03:23:17 by ybayart           #+#    #+#              #
#    Updated: 2019/12/09 03:39:42 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section	.text
		global	_ft_list_size

_ft_list_size:
		push	rbp
		mov		rbp, rsp

		xor		rcx, rcx
		jmp		_do

_inc:
		inc		rcx

_do:
		cmp		rdi, 0
		je		_end
		mov		rdi, [rdi+8]
		jmp		_inc

_end:
		mov		rax, rcx
		leave
		ret
