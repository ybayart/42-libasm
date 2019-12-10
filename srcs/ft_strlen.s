# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/06 19:20:28 by ybayart           #+#    #+#              #
#    Updated: 2019/12/08 22:23:11 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section	.text
		global	_ft_strlen

_ft_strlen:
		push rbp
		mov rbp, rsp

		xor al, al
		xor rcx, rcx

		not rcx

		cld

		repnz scasb

		not rcx
		dec rcx

		mov rax, rcx

		leave
		ret
