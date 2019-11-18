PWD = $(shell pwd)
default:
	make build
	make run
build:
	docker build -t dmitry_pytorch .

run:
	docker run -it \
		--rm \
		--name frame_player \
		--shm-size 62G \
		--ipc='host' \
		-p 3000:3000 \
		-w /project \
		-v /Users/V/Projects/frame-player/:/project/ \
		dmitry_pytorch /bin/bash -c "tmux"

		#--runtime=nvidia \
		#-v /home/dimitri/local_data/:/project/pacemaker/local_data \
		#-v /home/dimitri/local_data/:/project/timi/local_data \
		#-v /home/dimitri/project/:/project \
		#-v /mnt/AI-Efficiency-Sync/:/project/data:ro \
