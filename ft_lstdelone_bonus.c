/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstdelone_bonus.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/28 01:31:35 by tgrekov           #+#    #+#             */
/*   Updated: 2023/11/06 13:06:01 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * @file ft_lstdelone_bonus.c
 * @dontinclude ft_lstdelone_bonus.c
 * @line /\* *********
 * @until /\* *********
 */

#include "libft.h"

/**
 * @brief Delete a @ref s_list "node" and it's @ref s_list::content "content"
 * 
 * @param lst Pointer to the first @ref s_list "node" in the list
 * @param del Function used to properly handle the deletion of the
 * @ref s_list "node"'s @ref s_list::content "content"
 */
void	ft_lstdelone(t_list *lst, void (*del)(void *))
{
	if (!lst || !del)
		return ;
	del(lst->content);
	free(lst);
}
