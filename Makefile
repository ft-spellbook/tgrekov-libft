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
	ft_itoa.c		\
	ft_memchr.c		\
	ft_memcmp.c		\
	ft_memcpy.c		\
	ft_memmove.c	\
	ft_memset.c		\
	ft_putchar_fd.c	\
	ft_putendl_fd.c	\
	ft_putnbr_fd.c	\
	ft_putstr_fd.c	\
	ft_split.c		\
	ft_strchr.c		\
	ft_strdup.c		\
	ft_striteri.c	\
	ft_strjoin.c	\
	ft_strlcat.c	\
	ft_strlcpy.c	\
	ft_strlen.c		\
	ft_strmapi.c	\
	ft_strncmp.c	\
	ft_strnstr.c	\
	ft_strrchr.c	\
	ft_strtrim.c	\
	ft_substr.c		\
	ft_tolower.c	\
	ft_toupper.c

SRCS_BONUS = ft_lstiter_bonus.c			\
			ft_lstadd_back_bonus.c		\
			ft_lstadd_front_bonus.c		\
			ft_lstclear_bonus.c			\
			ft_lstdelone_bonus.c		\
			ft_lstlast_bonus.c			\
			ft_lstmap_bonus.c			\
			ft_lstnew_bonus.c			\
			ft_lstsize_bonus.c

HEADERS = libft.h

OBJS_DIR = objs/

OBJS = $(SRCS:%.c=%.o)
OBJS_PREFIXED = $(addprefix $(OBJS_DIR), $(OBJS))

OBJS_BONUS = $(SRCS_BONUS:%.c=%.o)
OBJS_BONUS_PREFIXED = $(addprefix $(OBJS_DIR), $(OBJS_BONUS))

.PHONY: all clean fclean re

# $@ name of the rule
# $^ prerequisite of the rule
# $< first prerequisite
$(OBJS_DIR)%.o: %.c $(HEADERS)
	mkdir -p $(OBJS_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS_PREFIXED)
	ar r $(NAME) $^

bonus: $(OBJS_BONUS_PREFIXED)
	ar r $(NAME) $^

all: $(NAME)

clean:
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all