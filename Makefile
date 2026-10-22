# Платформа: только делегирование. Логика живёт в сабмодулях, чтобы не было второй копии знания.
.PHONY: bootstrap check up health ci-all submodules

bootstrap:            ## разложить воркспейс и поднять стенд (см. infra/bootstrap.sh)
	bash infra/bootstrap.sh

check:                ## предпосылки и раскладка без записи
	bash infra/bootstrap.sh --check

health:               ## сторожа обвязки
	$(MAKE) -C infra health

up:                   ## поднять инструменты и продукты (порядок — в bootstrap.sh)
	bash infra/bootstrap.sh

ci-all:               ## проверка каждого проекта его же целью
	$(MAKE) -C infra ci
	$(MAKE) -C models ci
	$(MAKE) -C search ci
	$(MAKE) -C realty ci
	$(MAKE) -C news ci
	$(MAKE) -C agent-core ci

submodules:           ## показать пины сабмодулей
	git submodule status
