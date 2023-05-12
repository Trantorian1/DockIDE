/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/11 22:41:40 by marvin            #+#    #+#             */
/*   Updated: 2023/05/12 04:11:07 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

int32_t	main(void)
{
	uint32_t	index;

	index = (uint32_t)(-1);
	while (++index < 10)
		printf("%d\n", index);

	return (EXIT_SUCCESS);
}
