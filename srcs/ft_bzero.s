# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybayart <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/09 00:19:43 by ybayart           #+#    #+#              #
#    Updated: 2019/12/09 02:00:50 by ybayart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section	.text
		global	_ft_bzero

_ft_bzero:
		push	rbp
		mov		rbp, rsp

		mov		rcx, rsi

		xor		al, al

		rep		stosb

		leave
		ret
