using TraduDelta.CLI;
using TraduDelta.Lib.Utils;
using TraduDelta.Lib.Utils.Helpers;

cmdutils.print("Welcome to TraduDelta by D3fau4!", ConsoleColor.Magenta);

var arguments = new HandlerArgs(args);

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
    case HandlerArgs.Mode.MergePo:
    {
        var helper = new PoMergeTranslation();
        helper.Process(arguments.poOld, arguments.poNew);
        break;
    }
    case HandlerArgs.Mode.ExtractText:
    {
        var helper = new Gamewin2Po();
        helper.Process(arguments.GameWinPath, arguments.ch1TextPath, arguments.ch2jpTextPath);
        break;
    }
}