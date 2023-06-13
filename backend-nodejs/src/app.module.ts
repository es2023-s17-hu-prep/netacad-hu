import { Module } from '@nestjs/common';
import { MenuModule } from './modules/menu/menu.module';
import { SubMenuModule } from './modules/sub-menu/sub-menu.module';
import {PrismaModule} from "./libs/prisma/prisma.module";
import {ConfigModule} from "./libs/config/config.module";

@Module({
  imports: [MenuModule, SubMenuModule, PrismaModule, ConfigModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
