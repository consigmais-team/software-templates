namespace microservice.Service;

using microservice.Data;
using microservice.Entity;

public class UserService {
    private MicroserviceContext context;

    private ILogger<UserService> logger;

    public UserService(MicroserviceContext context, ILogger<UserService> logger) {
        this.context = context;
        this.logger = logger;
    }

    public List<User> getUsers() {
        logger.LogInformation("retrieving users");
        return context.Users.ToList();
    }
}