# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/08 18:06:49 by ybayart           #+#    #+#              #
#    Updated: 2019/12/08 23:28:24 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section	.text
		global	_ft_strdup
		extern	_malloc
		extern	_ft_strlen
		extern	_ft_strcpy

_ft_strdup:
		push	rbp
		mov		rbp, rsp

		push	rdi
		sub		rsp, 8

		call	_ft_strlen

		add		rsp, 8
		inc		rax
		push	rax

		mov		rdi, rax
		call	_malloc

		pop		rdx
		pop		rsi

		test	rax, rax
		jz		_end

		mov		rdi, rax
		call	_ft_strcpy

_end:
		leave
		ret
