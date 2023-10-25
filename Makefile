NAME = libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror

SRCS = ft_atoi.c	\
	ft_bzero.c		\
	ft_calloc.c		\
	ft_isalnum.c	\
	ft_isalpha.c	\
	ft_isascii.c	\
	ft_isdigit.c 	\
	ft_isprint.c	\
	ft_memchr.c		\
	ft_memcmp.c		\
	ft_memcpy.c		\
	ft_memmove.c	\
	ft_memset.c		\
	ft_strchr.c		\
	ft_strdup.c		\
	ft_strjoin.c	\
	ft_strlcat.c	\
	ft_strlcpy.c	\
	ft_strlen.c		\
	ft_strncmp.c	\
	ft_strnstr.c	\
	ft_strrchr.c	\
	ft_tolower.c	\
	ft_toupper.c

HEADERS = libft.h

OBJS_DIR = objs/
OBJS = $(SRCS:%.c=%.o)
OBJS_PREFIXED = $(addprefix $(OBJS_DIR), $(OBJS))

.PHONY: all clean fclean re

# $@ name of the rule
# $^ prerequisite of the rule
# $< first prerequisite
$(OBJS_DIR)%.o: %.c $(HEADERS)
	mkdir -p $(OBJS_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS_PREFIXED)
	ar r $(NAME) $(OBJS_PREFIXED)

all: $(NAME)

clean:
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all