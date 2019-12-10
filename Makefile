NAME = libasm.a
NAME_TEST = testbin

ASFLAGS = -f macho64 -MD
CFLAGS = -Wall -Wextra -Werror

ifeq ($(DEBUG),yes)
	CFLAGS += -O0 -g -DDEBUG #-fsanitize=address,undefined
	ASFLAGS += -g
else
	CFLAGS += -O2 -flto -march=native
endif

SRC_NAME =	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s \
			ft_bzero.s \
			ft_atoi_base.s \
			ft_list_create_elem.s \
			ft_list_push_front.s \
			ft_list_size.s \
			ft_list_sort.s \
			ft_list_remove_if.s

SRC_TEST =	main.c \
			ft_print_memory.c

SRC_DIR = srcs
TEST_DIR = test
BUILD_DIR = objs
INC_DIR = includes

OBJ = $(addprefix $(BUILD_DIR)/,$(SRC_NAME:.s=.o))
DPD = $(addsuffix .d,$(OBJ))

OBJ_TEST = $(addprefix $(BUILD_DIR)/,$(SRC_TEST:.c=.o))
DPD_TEST = $(addprefix $(BUILD_DIR)/,$(SRC_TEST:.c=.d))

opti:
	@$(MAKE) -j all

test: $(OBJ_TEST)
	@$(MAKE) opti
	gcc $(CFLAGS) $(OBJ_TEST) $(NAME) -o $(NAME_TEST)

debug:
	@$(MAKE) opti DEBUG=yes

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[2K \033[A"
	@ar rcs $(NAME) $(OBJ)
	@echo "$(NAME) created"
	@echo "$(NAME_TEST)" > .gitignore

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(BUILD_DIR)
	@echo "\033[2K [$(NAME)]: Compilation of $< \033[A"
	@nasm $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: $(TEST_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	@echo "\033[2K [$(NAME_TEST)]: Compilation of $< \033[A"
	@gcc $(CFLAGS) -I $(INC_DIR) -c $< -o $@

clean:
	@rm -rf $(BUILD_DIR)
	@echo "[$(NAME)]: OBJ deleted"

fclean:
	@rm -f $(NAME)
	@echo "[$(NAME)]: deleted"
	@rm -f $(NAME_TEST)
	@echo "[$(NAME_TEST)]: deleted"
	@$(MAKE) clean

re :
	@$(MAKE) fclean
	@$(MAKE) opti

.PHONY: all, clean, fclean, re, $(TEST_DIR)

-include $(DPD)
-include $(DPD_TEST)
