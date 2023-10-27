/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/28 01:50:13 by tgrekov           #+#    #+#             */
/*   Updated: 2023/10/28 02:02:22 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

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
