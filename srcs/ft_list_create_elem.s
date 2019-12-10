# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_create_elem.s                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/08 22:58:06 by ybayart           #+#    #+#              #
#    Updated: 2019/12/10 03:23:45 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section	.text
		global	_ft_list_create_elem
		extern	_malloc
		extern	_bzero

_ft_list_create_elem:
		push	rbp
		mov		rbp, rsp

		mov		rdx, rdi
		mov		rdi, 16

		push	rdx
		push	rdi

		call	_malloc

		pop		rsi
		sub		rsp, 8
		mov		rdi, rax

		call	_bzero

		add		rsp, 8
		pop		rdx

		mov		[rax], rdx
	
_end:
		leave
		ret
