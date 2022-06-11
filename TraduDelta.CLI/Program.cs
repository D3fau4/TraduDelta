using TraduDelta.CLI;
using TraduDelta.Lib.Utils;

cmdutils.print("Welcome to TraduDelta by D3fau4!", ConsoleColor.Magenta);

HandlerArgs arguments = new HandlerArgs(args);

if (arguments.OperationMode is null || arguments.OperationMode == HandlerArgs.Mode.Help)
{
    HandlerArgs.PrintInfo();
    return;
}

switch (arguments.OperationMode)
{
    case HandlerArgs.Mode.ApplyMods:
        break;
    case HandlerArgs.Mode.Json2Po:
        break;
    case HandlerArgs.Mode.ExtractText:
        break;
}