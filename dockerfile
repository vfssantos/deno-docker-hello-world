FROM denoland/deno:alpine

# Set workdir back to base /app 
WORKDIR /app

# Create a simple Deno health check script
RUN echo 'Deno.serve({ port: 8000 }, () => new Response("OK", { status: 200 }));' > health_check.ts

EXPOSE 8000

# Use a shell form of ENTRYPOINT to run both dotnet and deno commands
ENTRYPOINT ["sh", "-c", "deno run --allow-net /app/health_check.ts"]
