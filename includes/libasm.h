/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ybayart <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/06 17:35:02 by ybayart           #+#    #+#             */
/*   Updated: 2019/12/10 05:30:31 by ybayart          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include "libasm_tp.h"

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(char *dst, const char *src);
ssize_t	ft_write(int fd, const void *buf, size_t n);
ssize_t	ft_read(int fd, const void *buf, size_t n);
char	*ft_strdup(char *str);
char	ft_bzero(void *s, size_t n);
t_list	*ft_list_create_elem(void *data);
void	*ft_list_push_front(t_list **lst, void *data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref,
						int (*cmp)(), void (*free_fct)(void *));

#endif
