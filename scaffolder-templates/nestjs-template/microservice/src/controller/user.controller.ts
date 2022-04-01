import { Controller } from "@nestjs/common";
import { Crud, CrudController } from "@nestjsx/crud";
import { User } from "src/entity/user.entity";
import { UserService } from "src/service/user.service";


@Crud({
    model: {
        type: User,
    },
    query: {
        alwaysPaginate: true,
    }
})
@Controller('users')
export class UserController implements CrudController<User> {
    constructor(readonly service: UserService) {}
}