/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/28 01:50:13 by tgrekov           #+#    #+#             */
/*   Updated: 2023/11/06 12:28:11 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * @file ft_lstmap_bonus.c
 * @dontinclude ft_lstmap_bonus.c
 * @line /\* *********
 * @until /\* *********
 */

#include "libft.h"

/**
 * @brief Iterate over a list and create a new one from the results of applying
 * @p f to the @ref s_list::content "content" of each @ref s_list "node"
 * 
 * @param[in] lst Pointer to the starting @ref s_list "node"
 * @param[in] f Function which takes the @ref s_list::content "content" of the
 * current @ref s_list "node" and returns the @ref s_list::content "content"
 * for the new @ref s_list "node"
 * @param[in] del Function used to properly handle deletion of each
 * @ref s_list "node"'s @ref s_list::content "content"
 * in the new list, should allocation fail
 * @retval t_list* Pointer to the first @ref s_list "node" in the new list
 */
t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*start;
	t_list	*new;

	if (!lst || !f || !del)
		return (0);
	start = ft_lstnew(f(lst->content));
	if (!start)
		return (0);
	new = start;
	lst = lst->next;
	while (lst)
	{
		new->next = ft_lstnew(f(lst->content));
		new = new->next;
		if (!new)
		{
			ft_lstclear(&start, del);
			return (0);
		}
		lst = lst->next;
	}
	return (start);
}
