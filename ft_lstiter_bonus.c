/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstiter_bonus.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/28 01:46:44 by tgrekov           #+#    #+#             */
/*   Updated: 2023/11/06 12:25:44 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * @file ft_lstiter_bonus.c
 * @dontinclude ft_lstiter_bonus.c
 * @line /\* *********
 * @until /\* *********
 */

#include "libft.h"

/**
 * @brief Iterates over a list and applies
 * the function @p f over each @ref s_list "node"
 * 
 * @param lst Pointer to the first @ref s_list "node" in the list
 * @param f Function which accepts the
 * @ref s_list::content "content" of a @ref s_list "node"
 */
void	ft_lstiter(t_list *lst, void (*f)(void *))
{
	while (lst)
	{
		f(lst->content);
		lst = lst->next;
	}
}
