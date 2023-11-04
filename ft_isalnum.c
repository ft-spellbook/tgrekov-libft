/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isalnum.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tgrekov <tgrekov@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/23 13:29:39 by tgrekov           #+#    #+#             */
/*   Updated: 2023/11/04 22:24:45 by tgrekov          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * @file ft_isalnum.c
 * @dontinclude ft_isalnum.c
 * @line /\* *********
 * @until /\* *********
 */

#include "libft.h"

/**
 * @brief Is c an alphanumeric character
 * 
 * @param[in] c Character to test
 * @retval int @p 1 if either @ref ft_isalpha "ft_isalpha"
 * or @ref ft_isdigit "ft_isdigit", otherwise @p 0.
 */
int	ft_isalnum(int c)
{
	return (ft_isalpha(c) || ft_isdigit(c));
}
