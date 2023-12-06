echo "Downloading SVD model"
python3 download_svd.py

streamlit run scripts/demo/video_sampling.py --server.address 0.0.0.0 --server.port 7005
