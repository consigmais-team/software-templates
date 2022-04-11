import { HttpModule } from '@nestjs/axios';
import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TerminusModule } from '@nestjs/terminus';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserController } from './controller/user.controller';
import { User } from './entity/user.entity';
import { UserService } from './service/user.service';
import { HealthController } from './controller/health.controller';

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,
      port: parseInt(process.env.DB_PORT),
      username: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
      entities: [User],
    }),
    TypeOrmModule.forFeature([User]),
    HttpModule,
    TerminusModule,
  ],
  controllers: [AppController, UserController, HealthController],
  providers: [AppService, UserService],
})
export class AppModule {}
