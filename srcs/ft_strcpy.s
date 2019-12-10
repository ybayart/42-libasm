# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/06 19:35:18 by ybayart           #+#    #+#              #
#    Updated: 2019/12/10 04:20:21 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section	.text
		global	_ft_strcpy

_ft_strcpy:
		push	rbp
		mov		rbp, rsp

		mov		rcx, rdi

		jmp		_loop

_do:
		mov		BYTE [rcx], al
		inc		rcx
		inc		rsi
		test	al, al
		jz		_end

_loop:
		mov		al, BYTE [rsi]

		jmp		_do

_end:
		mov		rax, rdi
		leave
		ret
