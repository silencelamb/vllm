proxy_off
# Start the app with default settings
streamlit run streamlit_openai_chatbot_webserver.py

# Start with custom vLLM API endpoint
# VLLM_API_BASE="http://your-server:8000/v1" \
        # streamlit run streamlit_openai_chatbot_webserver.py

# Enable debug mode
# streamlit run streamlit_openai_chatbot_webserver.py \
	# --logger.level=debug
