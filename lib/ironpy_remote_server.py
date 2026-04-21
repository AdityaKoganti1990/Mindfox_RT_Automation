from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
import clr
import sys
import os
import traceback

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DLL_PATH = os.path.join(BASE_DIR, 'dotnet', 'GlobalLibrary.dll')

print('IronPython Remote Server starting...')
print('Loading assembly from', DLL_PATH)
try:
    clr.AddReferenceToFileAndPath(DLL_PATH)
    from GlobalLibrary import GUIOperations
    print('Loaded GlobalLibrary.GUIOperations')
except Exception:
    print('Failed to load GlobalLibrary:')
    traceback.print_exc()
    raise


class RequestHandler(SimpleXMLRPCRequestHandler):
    rpc_paths = ('/RPC2',)


def control_click(applicationName, title, controlId, state):
    try:
        inst = GUIOperations()
        result = inst.ControlClick(applicationName, title, controlId, state)
        return str(result)
    except Exception:
        tb = traceback.format_exc()
        print('control_click exception:')
        print(tb)
        return tb

def save_scanview_image(applicationName, title, controlId='rbPage_Tools', filename=None):
    """Call GUIOperations.SaveControlImage (or Save_Control_Image) if available.
    Returns result string or exception traceback.
    """
    try:
        inst = GUIOperations()
        # Try common method names
        if hasattr(inst, 'SaveScanViewImage'):
            method = getattr(inst, 'SaveScanViewImage')
        else:
            return "Method SaveScanViewImage not found on GlobalLibrary.GUIOperations"
        # Call with or without filename depending on signature
        method(applicationName, title, controlId, filename)
    except Exception:
        tb = traceback.format_exc()
        print('save_control_image exception:')
        print(tb)
        return tb
    
def save_control_image(applicationName, title, controlId='rbPage_Tools', state='True', filename=None):
    """Call GUIOperations.SaveControlImage (or Save_Control_Image) if available.
    Returns result string or exception traceback.
    """
    try:
        inst = GUIOperations()
        # Try common method names
        if hasattr(inst, 'SaveControlImage'):
            method = getattr(inst, 'SaveControlImage')
        else:
            return "Method SaveControlImage not found on GlobalLibrary.GUIOperations"
        # Call with or without filename depending on signature
        method(applicationName, title, controlId, filename,state)
    except Exception:
        tb = traceback.format_exc()
        print('save_control_image exception:')
        print(tb)
        return tb


def invoke_method(method_name, *args):
    """Generic invoker: attempts to call a method on GUIOperations with given args.

    Useful for one-off calls; returns the method result or traceback string.
    """
    try:
        inst = GUIOperations()
        if not hasattr(inst, method_name):
            return "Method {0} not found on GlobalLibrary.GUIOperations".format(method_name)
        method = getattr(inst, method_name)
        res = method(*args)
        return str(res)
    except Exception:
        tb = traceback.format_exc()
        print('invoke_method {0} exception:'.format(method_name))
        print(tb)
        return tb


def run_server(host='0.0.0.0', port=8270):
    server = SimpleXMLRPCServer((host, port), requestHandler=RequestHandler, allow_none=True)
    server.register_introspection_functions()
    server.register_function(control_click, 'control_click')
    server.register_function(save_control_image, 'save_control_image')
    server.register_function(save_scanview_image, 'save_scanview_image')
    server.register_function(invoke_method, 'invoke_method')
    print('IronPython XML-RPC server listening on {0}:{1}'.format(host, port))
    server.serve_forever()


if __name__ == '__main__':
    run_server()
